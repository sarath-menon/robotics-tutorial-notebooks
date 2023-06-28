using LinearAlgebra, DifferentialEquations
using GLMakie

# dynamics First writeen in normal function form, then converted to modellingtoolkit form using modelingtoolkitize() funciton

function cart_pendulum(dq, q, params, t)

    # get parameters
    mc, mp, Jp, l, g, c, γ = params

    # control input
    u = 1.0

    # get state variables
    x = q[1]
    θ = q[2]
    ẋ = q[3]
    θ̇ = q[4]

    M = [mc+mp -mp*l*cos(θ)
        -mp*l*cos(θ) Jp+(mp*l^2)]

    C = [(c * ẋ + mp * l * sin(θ) * θ̇^2) - u
        γ * θ̇ - mp * g * l * sin(θ)]

    dq[1:2] = q[3:4]
    dq[3:4] = inv(M) * -C

    return nothing
end

nu = 1    # number of control inputs
nx = 4    # number of states
ny = 2    # number of outputs (here we assume that the cart position and the pendulum angle are measurable)

# (mass matrix to set constraints, du[5]=0)
cart_pendulum_fun! = ODEFunction(cart_pendulum)

## SOlve numerically 

#Initial Conditions
u₀ = [0, 0, 0, 0]

# parameters [mc, mp, Jp, l, g, c, γ]
parameters = [10, 80, 100, 1, 9.81, 0.1, 0.01]

## Option 2: ModelingToolkit - ODAEProblem with non-stiff ODE solver
tspan = (0.0, 10)

cart_pendulum_prob = ODEProblem(cart_pendulum_fun!, u₀, tspan, parameters)
@named traced_sys = modelingtoolkitize(cart_pendulum_prob)
cart_pendulum_sys = structural_simplify(dae_index_lowering(traced_sys))

prob = ODAEProblem(cart_pendulum_sys, Pair[], tspan)
sol = solve(prob, Tsit5(), abstol=1e-8, reltol=1e-8)

## Plotting
fig = Figure(resolution=(800, 800))

cart_pos_ax = Axis(fig[1, 1], title="Cart Position")
pend_angle_ax = Axis(fig[2, 1], title="Pendulum angle")
cart_vel_ax = Axis(fig[3, 1], title="Cart Velocity")
pend_angular_vel_ax = Axis(fig[4, 1], title="Pendulum angular velocity")

lines!(cart_pos_ax, sol.t[:], sol[1, :])
lines!(pend_angle_ax, sol.t[:], sol[2, :])
lines!(cart_vel_ax, sol.t[:], sol[3, :])
lines!(pend_angular_vel_ax, sol.t[:], sol[4, :])

cart_pos_ax.ylabel = "position [m]"
pend_angle_ax.ylabel = "angle [rad]"
cart_vel_ax.ylabel = "cart velocity [m/s]"
pend_angular_vel_ax.ylabel = "angular velocity [rad/s]"

pend_angular_vel_ax.xlabel = "time [s]"

rowgap!(fig.layout, 5)

# rowsize!(fig.layout, 1, Aspect(1, 0.25))
# rowsize!(fig.layout, 2, Aspect(1, 0.25))

display(fig)