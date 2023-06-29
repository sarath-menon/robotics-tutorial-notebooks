function circle_trajectory(r::Float64, ω::Float64, dt::Float64, tspan::Tuple)
    
    x_vec = Float64[]
    y_vec = Float64[]
        
    for t in tspan[1]:dt:tspan[2]
        x = r * cos(ω*t)
        y = r * sin(ω*t)
    
        push!(x_vec, x)
        push!(y_vec, y)
    end

    return [x_vec, y_vec]
end