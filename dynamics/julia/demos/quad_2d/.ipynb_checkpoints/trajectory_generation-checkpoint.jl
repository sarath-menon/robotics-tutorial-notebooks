abstract type Trajectory end

struct CircleTrajectory2 <: Trajectory 
    r::Float64       # radius [m]
    ω::Float64       # angular velocity [rad/s]
    tspan::Tuple     # [seconds] eg. (0.0,10.0)
    dt::Float64      # [seconds] 
end

CircleTrajectory = CircleTrajectory2


function generate_trajectory(trajec::CircleTrajectory)

    t_vec = trajec.tspan[1]:trajec.dt:trajec.tspan[2]

    # x_vec = Vector{Float64}(undef, size(t_vec)) 
    # y_vec = Vector{Float64}(undef, size(t_vec)) 

    x_vec = Float64[]
    y_vec = Float64[]
        
    for t in t_vec
        x::Float64 = trajec.r * cos(trajec.ω*t)
        y::Float64 = trajec.r * sin(trajec.ω*t)
    
        push!(x_vec, x)
        push!(y_vec, y)
    end

    return [x_vec, y_vec]
end