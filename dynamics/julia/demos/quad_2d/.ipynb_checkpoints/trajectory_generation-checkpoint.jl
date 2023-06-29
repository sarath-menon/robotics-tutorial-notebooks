
function generate_circle_trajectory(trajec::NamedTuple)

    # Getting value using Key
    tspan = getindex(trajec, :tspan)
    dt = getindex(trajec, :dt)
    r = getindex(trajec, :r)
    ω = getindex(trajec, :ω)

    t_vec = tspan[1]:dt:tspan[2]

    x_vec = Float64[]
    y_vec = Float64[]
        
    for t in t_vec
        x::Float64 = r * cos(ω*t)
        y::Float64 = r * sin(ω*t)
    
        push!(x_vec, x)
        push!(y_vec, y)
    end

    return [x_vec, y_vec]
end

