
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



function generate_circle_trajectory(trajec::NamedTuple, t::Vector{Float64})

    # Getting value using Key
    tspan = getindex(trajec, :tspan)
    
    dt = getindex(trajec, :dt)
    r = getindex(trajec, :r)
    ω = getindex(trajec, :ω)

    y₀ = getindex(trajec, :y₀)
    z₀ = getindex(trajec, :z₀)

    y::Vector{Float64} = r*cos.(ω*t) .+ y₀
    z::Vector{Float64} = r*sin.(ω*t) .+ z₀

    # ẋ,ẏ = 0, since ω̇=0
    ẏ::Vector{Float64} = (-r*sin.(ω*t))*ω
    ż::Vector{Float64} = (r*cos.(ω*t))*ω

    ÿ::Vector{Float64} = -y .* (ω^2)
    z̈::Vector{Float64} = -z .* (ω^2)
    
    m::Float64 = 1.0
    
    # compute theta using differential flatness
    θ::Vector{Float64}= atan.(-m*ÿ, m*(z̈ .+ 9.81))
    θ̇ = 0 
    
    return [y, z, θ , ẏ , ż, θ̇]
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

    # ẋ,ẏ = 0, since ω̇=0
    ẏ::Float64 = (-r*sin(ω*t))*ω
    ż::Float64 = (r*cos(ω*t))*ω

    ÿ::Float64 = -y * (ω^2)
    z̈::Float64 = -z * (ω^2)
    
    m::Float64 = 1.0
    
    # compute theta using differential flatness
    θ::Float64 = atan(-m*ÿ, m*(z̈ + 9.81))
    θ̇ = 0 
    
    return [y, z, θ , ẏ , ż, θ̇]
end


