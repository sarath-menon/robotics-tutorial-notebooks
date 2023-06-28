# Simple Pendulum Problem
using DifferentialEquations
using GLMakie

#Define the problem
function pendulum(dx, x, params, t)

    # g = params["g"]
    # L = params["L"]
    g, L = params

    # get the state
    θ = x[1]
    dθ = x[2]

    # equations of motion
    dx[1] = dθ
    dx[2] = -(g / L) * sin(θ)
end

# parameters [g,L]
params = [9.8, 1]
# params = Dict{Symbol,Any}(:g => 9.8, :L => 1)

#Initial Conditions
u₀ = [π / 2, 0]
tspan = (0.0, 10)

#Pass to solvers
prob = ODEProblem(pendulum, u₀, tspan, params)
sol = solve(prob, Tsit5(), abstol=1e-8, reltol=1e-8)

## Plot

fig = Figure(resolution=(800, 400))

position_ax = Axis(fig[1, 1], title="Angle")
velocity_ax = Axis(fig[2, 1], title="Angular Velocity")

lines!(position_ax, sol.t[:], sol[1, :])
lines!(velocity_ax, sol.t[:], sol[2, :])

position_ax.ylabel = "angle [rad]"
velocity_ax.ylabel = "angular velocity [rad/s]"
velocity_ax.xlabel = "time [s]"

rowgap!(fig.layout, 5)

display(fig)
