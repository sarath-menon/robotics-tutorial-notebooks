# convert standrard quaternion, euler angle to makie quaternin type
function to_makie_quaternion(R_quat::QuatRotation)::Quaternion
    return Quaternion(R_quat.q.s, R_quat.q.v1, R_quat.q.v2, R_quat.q.v3)
end

function to_makie_quaternion(R_euler::RotZYX)::Quaternion

    # Convert the rotation to unit quaternion
    R_quat = QuatRotation(R_euler)

    return Quaternion(R_quat.q.s, R_quat.q.v1, R_quat.q.v2, R_quat.q.v3)
end

function plot_axis2d(axis::Axis; x::Vector{Float64}, y::Vector{Float64}, title::String, linestyle=nothing, color=:black, linewidth=3)
    # set title
    axis.title = title

    # fraw plot
    lines!(axis, x, y, linestyle=linestyle, color=color, linewidth=linewidth)
end

function plot_trajectory(config_dict::Dict, config)
    # diplayed plots
    for (i, title) in enumerate(config_dict[config])
        # clear axis
        empty!(state_plots[i])

        # plot actual trajectory 
        plot_axis2d(state_plots[i]; x=df.timestamp, y=df[!, title], title=title, linewidth=2)

        # plot desired trajectory 
        plot_axis2d(state_plots[i]; x=df.timestamp, y=df[!, title*"_req"], title=title, linestyle=:dash, color=:green, linewidth=6)
    end
end

function plot_3d_trajectory(; sim_time_obs::Observable, duration=10.0, dt=0.01, frame_rate=25)

    step_count::Integer = convert(Integer, duration / dt)

    n_skip_frames::Int8 = convert(Int8, 100 / frame_rate)

    for i in 1:n_skip_frames:step_count
        max_range = 2.0
        dist = max_range / 2

        x_pos::Float64 = 0.0
        y_pos::Float64 = df[!, "y"][i]
        z_pos::Float64 = df[!, "z"][i]

        x_low::Float64 = x_pos - dist
        y_low::Float64 = y_pos - dist
        z_low::Float64 = z_pos - dist

        x_high::Float64 = x_pos + dist
        y_high::Float64 = y_pos + dist
        z_high::Float64 = z_pos + dist

        # set the time observable
        sim_time::Float64 = round(df[!, "timestamp"][i], digits=2)
        sim_time_obsv[] = sim_time

        # set timeline slider value 
        set_close_to!(timeline_slider, sim_time)

        vis_ax.limits = (x_low, x_high, y_low, y_high, z_low, z_high)
        translate!(m, Vec3f(x_pos, y_pos, z_pos))

        rotate!(m, Vec3f(1, 0, 0), rad2deg(df[!, "θ"][i]))

        sleep(n_skip_frames * dt)
    end


end