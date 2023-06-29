
function generate_circle_trajectory(trajec::NamedTuple)

    # Getting value using Key
    tspan = getindex(trajec, :tspan)
    dt = getindex(trajec, :dt)
    r = getindex(trajec, :r)
    ω = getindex(trajec, :ω)

    y₀ = getindex(trajec, :y₀)
    z₀ = getindex(trajec, :z₀)

    t_vec = tspan[1]:dt:tspan[2]

    x_vec = Float64[]
    y_vec = Float64[]
        
    for t in t_vec
        x::Float64 = (r*cos(ω*t)) + y₀
        y::Float64 = (r*sin(ω*t)) + z₀
    
        push!(x_vec, x)
        push!(y_vec, y)
    end

    return [x_vec, y_vec]
end



function generate_circle_trajectory(trajec::NamedTuple, t::Float64)

    # Getting value using Key
    tspan = getindex(trajec, :tspan)
    
    dt = getindex(trajec, :dt)
    r = getindex(trajec, :r)
    ω = getindex(trajec, :ω)

    y₀ = getindex(trajec, :y₀)
    z₀ = getindex(trajec, :z₀)

    y::Float64 = (r*cos(ω*t)) + y₀
    z::Float64 = (r*sin(ω*t)) + z₀

    # ẋ::Float64 = -r * sin(ω*t)*ω̇
    # ẏ::Float64 = r * cos(ω*t)*ω̇

    # ẋ,ẏ = 0, since ω̇=0
    ẏ::Float64 = 0
    ż::Float64 = 0
    
    m::Float64 = 1.0
    
    # compute theta using differential flatness
    θ::Float64 = atan(1, m*9.81)

    # θ̇ = 0, since ẍ=ÿ=0
    θ̇ = 0 
    
    
    
    return [y, z, θ , ẏ , ż, θ̇]
end
