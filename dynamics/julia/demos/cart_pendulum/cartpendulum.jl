using LinearAlgebra, DifferentialEquations
using ModelingToolkit, OrdinaryDiffEq
using GLMakie


# dynamics written in modellingtoolkit form

# define parameters and variables
@parameters mc, mp, Jp, l, g, c, γ, u
@variables t x(t) θ(t) (M(t))[1:2, 1:2] (C(t))[2] (X_dot(t))[2]

# define operators
D = Differential(t)

# equations of motion
M = [mc+mp -mp*l*cos(θ)
    -mp*l*cos(θ) Jp+(mp*l^2)];
C = [(c * D(x) + mp * l * sin(θ) * D(θ)^2) - u
    γ * D(θ) - mp * g * l * sin(θ)];
X_dot = inv(M) * -C;


# dunamics equations
eqs = [D(D(x)) ~ X_dot[1],
    D(D(θ)) ~ X_dot[2]]

# create ODESystem and simplify
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)

## Solve numerically

# initial conditions
u₀ = [D(θ) => 0.0,
    θ => 0.0,
    D(x) => 0.2,
    x => 0.0]

# parameter values
p = [mc => 10,
    mp => 80,
    Jp => 100,
    l => 1,
    g => 9.81,
    c => 0.1,
    γ => 0.01,
    u => 0.0]

#Pass to solver
tspan = (0.0, 10.0)
prob = ODEProblem(sys, u₀, tspan, p, jac=true)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)

## Plotting
fig = Figure(resolution=(800, 800))

cart_pos_ax = Axis(fig[1, 1], title="Cart Position")
pend_angle_ax = Axis(fig[2, 1], title="Pendulum angle")
cart_vel_ax = Axis(fig[3, 1], title="Cart Velocity")
pend_angular_vel_ax = Axis(fig[4, 1], title="Pendulum angular velocity")

lines!(cart_pos_ax, sol.t, sol[x])
lines!(pend_angle_ax, sol.t, sol[θ])
lines!(cart_vel_ax, sol.t, sol[D(x)])
lines!(pend_angular_vel_ax, sol.t, sol[D(θ)])

cart_pos_ax.ylabel = "position [m]"
pend_angle_ax.ylabel = "angle [rad]"
cart_vel_ax.ylabel = "cart velocity [m/s]"
pend_angular_vel_ax.ylabel = "angular velocity [rad/s]"

pend_angular_vel_ax.xlabel = "time [s]"

rowgap!(fig.layout, 5)

# rowsize!(fig.layout, 1, Aspect(1, 0.25))
# rowsize!(fig.layout, 2, Aspect(1, 0.25))

display(fig)