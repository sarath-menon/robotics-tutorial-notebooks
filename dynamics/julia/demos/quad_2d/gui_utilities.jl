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