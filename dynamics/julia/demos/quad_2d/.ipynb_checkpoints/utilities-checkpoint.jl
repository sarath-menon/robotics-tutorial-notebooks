function quad_2d_plot_normal(sol::ODESolution)
    fig = Figure(resolution=(1200, 400))

    x_ax = Axis(fig[1, 1], title="x")
    z_ax = Axis(fig[2, 1], title="z")
    theta_ax = Axis(fig[3, 1], title="theta")

    lines!(x_ax, sol.t, sol[1, :])
    lines!(z_ax, sol.t, sol[2, :])
    lines!(theta_ax, sol.t[:], sol[3, :])

    x_ax.ylabel = "x [m]"
    z_ax.ylabel = "z [m]"
    theta_ax.ylabel = "θ [rad]"

    rowgap!(fig.layout, 1)

    fig
end

function quad_2d_plot(sys::ODESystem, sol::ODESolution)
    fig = Figure(resolution=(1200, 600))

    # state variables 
    x_ax = Axis(fig[1, 1], title="x")
    z_ax = Axis(fig[2, 1], title="z")
    theta_ax = Axis(fig[3, 1], title="theta")

    # control input 
    thrust_ax = Axis(fig[1, 2], title="Thrust")
    torque_ax = Axis(fig[2, 2], title="Torque")

    lines!(x_ax, sol.t, sol[sys.y])
    lines!(z_ax, sol.t, sol[sys.z])
    lines!(theta_ax, sol.t[:], sol[sys.θ])

    thrust = sol[sys.f_1] + sol[sys.f_2]
    torque = (sol[sys.f_1] -  sol[sys.f_2]) * 0.2

    lines!(thrust_ax, sol.t, thrust)
    lines!(torque_ax, sol.t[:], torque )

    x_ax.ylabel = "x [m]"
    z_ax.ylabel = "z [m]"
    theta_ax.ylabel = "θ [rad]"

    thrust_ax.ylabel = "Thrust [N]"
    torque_ax.ylabel = "Toruqe [Nm]"

    rowgap!(fig.layout, 1)

    fig
end


function quad_2d_plot_state(sys::ODESystem, sol::ODESolution)
    fig = Figure(resolution=(400, 600))

    # state variables 
    x_ax = Axis(fig[1, 1], title="x")
    z_ax = Axis(fig[2, 1], title="z")
    theta_ax = Axis(fig[3, 1], title="theta")

    # # control input 
    # thrust_ax = Axis(fig[1, 2], title="Thrust")
    # torque_ax = Axis(fig[2, 2], title="Torque")

    lines!(x_ax, sol.t, sol[sys.y])
    lines!(z_ax, sol.t, sol[sys.z])
    lines!(theta_ax, sol.t[:], sol[sys.θ])

    # thrust = sol[sys.f_1] + sol[sys.f_2]
    # torque = (sol[sys.f_1] -  sol[sys.f_2]) * 0.2

    # lines!(thrust_ax, sol.t, thrust)
    # lines!(torque_ax, sol.t[:], torque )

    # x_ax.ylabel = "x [m]"
    # z_ax.ylabel = "z [m]"
    # theta_ax.ylabel = "θ [rad]"

    # thrust_ax.ylabel = "Thrust [N]"
    # torque_ax.ylabel = "Toruqe [Nm]"

    rowgap!(fig.layout, 1)

    fig
end

function quad_2d_plot_lsim(t,x)
    fig = Figure(resolution=(1200, 500))

    x_ax = Axis(fig[1, 1], title="x")
    z_ax = Axis(fig[2, 1], title="z")
    theta_ax = Axis(fig[3, 1], title="theta")
    
     # control input 
    thrust_ax = Axis(fig[1, 2], title="Thrust")
    torque_ax = Axis(fig[2, 2], title="Torque")
    
    lines!(x_ax, t, x[1, :])
    lines!(z_ax, t, x[2, :])
    lines!(theta_ax, t[:], x[3, :])
    
    
    thrust = uout[1,:] + uout[2,:] 
    torque = (uout[1,:] - uout[2,:]) * 0.1
    
    lines!(thrust_ax, t, thrust)
    lines!(torque_ax, t, torque )
    
    x_ax.ylabel = "x [m]"
    z_ax.ylabel = "z [m]"
    theta_ax.ylabel = "θ [rad]"
    
    rowgap!(fig.layout, 1)
    
    fig
end

struct SimParams1
    nx::Int8
    Ts::Float64
end
SimParams = SimParams1




# # initial conditions
# u₀ = Dict(
#     y => 0.0,
#     z => 2.0,
#     θ => 0.0,
#     D(y) => 0.0,
#     D(z) => 0.0,
#     D(θ) => 0.0,
# )

# # parameter values
# params = Dict(
#     l => 0.1,
#     I_zz => 0.003 ,
#     m => 0.5,
# )


# #Pass to solver
# tspan = (0.0, 10.0)
# prob = ODEProblem(sys, u₀, tspan, params, jac=true)
# sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8);

# #plotting
# quad_2d_plot(sol)