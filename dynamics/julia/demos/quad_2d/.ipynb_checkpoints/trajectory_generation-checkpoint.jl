
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


function generate_circle_trajectory(trajec_params::NamedTuple, quad_params::NamedTuple, t::Float64)
    m::Float64 = quad_params.m
    
    r::Float64 = trajec_params.r
    ω::Float64 = trajec_params.ω
    g::Float64 = trajec_params.g

    tspan = trajec_params.tspan
    y₀ = trajec_params.y₀
    z₀ = trajec_params.z₀

    y::Float64 = (r*cos(ω*t)) + y₀
    z::Float64 = (r*sin(ω*t)) + z₀

    ẏ::Float64 = (-r*sin(ω*t))*ω
    ż::Float64 = (r*cos(ω*t))*ω

    ÿ::Float64 = -y * (ω^2)
    z̈::Float64 = -z * (ω^2)
 

    ÿ_func(r::Real,ω::Real,t::Real) = -r*cos(ω*t) * (ω^2)
    z̈_func(r::Real,ω::Real,t::Real) = -r*sin(ω*t) * (ω^2)

    θ_func(t::Real) = atan(-m * ÿ_func(r,ω,t), m*(z̈_func(r,ω,t) -g))

    # compute θ, θ̇ using differential flatness
    θ::Float64 =  θ_func(t)
    θ̇::Float64 = ForwardDiff.derivative(θ_func, t) # constant value (precomputed)
    
    return [y, z, θ , ẏ , ż, θ̇]
end


