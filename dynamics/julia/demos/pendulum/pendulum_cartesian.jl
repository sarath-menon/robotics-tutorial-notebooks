using DifferentialEquations, ModelingToolkit
using LinearAlgebra, GLMakie

function pendulum!(du, u, params, t)
    # state
    x, dx, y, dy, T = u
    # parameters
    g, L = params

    du[1] = dx
    du[2] = T * x
    du[3] = dy
    du[4] = T * y - g
    du[5] = x^2 + y^2 - L^2

    return nothing
end

# (mass matrix to set constraints, du[5]=0)
pendulum_fun! = ODEFunction(pendulum!, mass_matrix=Diagonal([1, 1, 1, 1, 0]))

# initial condition
u0 = [1, 0, 0, 0, 0]

# parameters
p = [9.8, 1]

tspan = (0.0, 10.0)

## Option 1:  Formulate as ODE and try to solve (doesn't work)

pendulum_prob = ODEProblem(pendulum_fun!, u0, tspan, p)
sol = solve(pendulum_prob, Rodas4(), abstol=1e-8, reltol=1e-8)

## Option 2: ModelingToolkit - ODAEProblem with non-stiff ODE solver

@named traced_sys = modelingtoolkitize(pendulum_prob)
pendulum_sys = structural_simplify(dae_index_lowering(traced_sys))


prob = ODAEProblem(pendulum_sys, Pair[], tspan)
sol = solve(prob, Tsit5(), abstol=1e-8, reltol=1e-8)

## - Option 3: ODEProblem with stiff ODE solver
prob2 = ODEProblem(pendulum_sys, Pair[], tspan, jac=true)
sol = solve(prob2, Rodas4(), abstol=1e-8, reltol=1e-8)

## Plotting

fig = Figure(resolution=(800, 400))

position_ax = Axis(fig[1, 1], title="Position")
velocity_ax = Axis(fig[2, 1], title="Velocity")

lines!(position_ax, sol.t[:], sol[1, :])
lines!(velocity_ax, sol.t[:], sol[2, :])

position_ax.ylabel = "position [m]"
velocity_ax.ylabel = "velocity [m/s]"
velocity_ax.xlabel = "time [s]"

rowgap!(fig.layout, 5)

display(fig)