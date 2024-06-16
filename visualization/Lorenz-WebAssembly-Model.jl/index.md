\begin{section}{}

## Dynamical System
* Effect of the actions do not appear immediately - the behaviour evolves with time
* Eg. To go from 30 km/hr to 60 km/hr in a car we press the accelerator pedal. We know the card doesn't reach 60 km/hr immedately, it takes a few seconds to accelerate to that velocity.


# Mathematical models

* Mathematical Representation of a physical, biological or information system. In this class, we focus on dynamical systems (mostly in state-space form)
* "All models are wrong, but some are useful". Often, a model is an approximation of the real system. The real system might be too complicated to model perfectly. For eg. aerodynamic interactions between the rotor blades of a quadcopter, friction between the tire and ground for a physical robot etc. 
* The required modelling accuracy depends on the application at hand. Eg. aerodynamic drag can be neglected for low-speed control design for quadcopters
* Analysis and design must performed keeping in mind the limitations of the model

## Why models ?

* Simulation
* Controller design
* Verfication and Validaton
* Diagnostics, predictive maintenance

# Linear Models

Linear models are convenient becuase they're well understood. Lots of tools and techniques are available for the analysis, simulatios, synthesis, simulation, verification etc linear systems. Unfortunately, real world physical systems are never exactly linear. But the behaviour around the desired operating points can be approximated with a linearized version of the actual non-linear modle. Eg. for a quadcopter, the behaviour near hoover condtion can be approximated with linear systems 

# First order response

Equation is: $$ \tau\dot{x} + x = u(t) $$

where $\tau$ is the time constant. The output reaches around 63% of its steady state value with time $\tau$. 

\begin{showhtml}{}
```julia
#hideall
using StaticArrays
using DiffEqGPU, OrdinaryDiffEq
using WGLMakie
using Markdown
using JSServe
using StaticTools
import JSServe.TailwindDashboard as D

Page(exportable=true, offline=true) # for Franklin, you still need to configure
WGLMakie.activate!()
# Makie.inline!(true) # Make sure to inline plots into Documenter output!

# must be true to be found inside the DOM
is_widget(x) = true
# Updating the widget isn't dependant on any other state (only thing supported right now)
is_independant(x) = true
# The values a widget can iterate
function value_range end
# updating the widget with a certain value (usually an observable)
function update_value!(x, value) end

# forcing function
u(t) = 1

first_order_sys!(t,x;τ,u) = (u(t) - x) / τ

function first_order_sys!(X, params, t)
#function first_order_sys!(dX, X, params, t)

    # extract the parameters
    τ = params.τ

    # extract the state
    x = X[1]
    
    # x_dot = (u(t) - x) / τ
    x_dot = first_order_sys!(t,x;τ=τ,u=u)

    # dX[1] = x_dot
    # return nothing
    return SVector{1}([x_dot])
end



App() do session
    tau_slider = Slider(0.1:0.1:10.)

    # variables
    t = MallocVector{Float64}(undef,1000)
    y1 = MallocVector{Float64}(undef,1000)

    # First order system 
    # X0 = @SVector [0.0]
    X0 = SVector{1}([0.0])
    tspan = (0.0, 5.0)
    parameters = (;τ=0.2)
    
    prob2 = ODEProblem(first_order_sys!, X0, tspan, parameters)

    # plotting
    fig = Figure(resolution=(800,600))
    ax = Axis(fig[1, 1], 
        limits=(tspan[1], tspan[2], 0, 1.),
        title="First order response",
        titlefont=:regular,
        titlesize=30,
        xlabelsize=25,
        ylabelsize=25,
        xticklabelsize=25,
        yticklabelsize=25)

    x_vec = Observable{Vector{Float64}}([0.])
    y_vec = Observable{Vector{Float64}}([0.])

    lines!(ax, x_vec, y_vec)

    slider_grid_1 = DOM.div("Time Constant: ", tau_slider, tau_slider.value)

    # interactions
    app = map(tau_slider.value) do val
        params = (;τ=Float64(val) )

        integ = DiffEqGPU.init(GPUTsit5(), prob2.f, false, X0, 0.0, 0.005, params, nothing, CallbackSet(nothing), true, false)

        for i in Int32(1):Int32(1000)
            t[i] = integ.t
            y1[i] = integ.u[1]
            
            @inline DiffEqGPU.step!(integ, integ.t + integ.dt, integ.u)
          
        end
        
        x_vec[] =  t
        y_vec[] =  y1
    end
    
    return JSServe.record_states(session,  DOM.div(fig, slider_grid_1))
    
end

```
\end{showhtml}

# Second order response

Equation is: $$ \ddot{x} + 2 \zeta \omega_n \dot{x} + \omega_n^2x = u(t) $$

where $\tau$ is the time constant, $\zeta$ is the damping ratio and $\omega_n$ is the ntural frequency. One issue with this model is that thinking in terms of the natural frequency is often non-intuitive, unlike the time constant. For damping ratio close to 1, it can be approximated as $$ \ddot{x} + \frac{2\zeta\dot{x}}{\tau} + \frac{x}{\tau^2} = u(t) $$. Then, the settling time is around 4 time constants

\begin{showhtml}{}
```julia
#hideall
using StaticArrays
using DiffEqGPU, OrdinaryDiffEq
using WGLMakie
using Markdown
using JSServe
using StaticTools
import JSServe.TailwindDashboard as D

# forcing function
u(t) = 1

second_order_sys!(t,x, x_dot; τ,ζ,u) = -(2*ζ*x_dot)/τ - x/τ^2 +  u(t)/τ^2

function second_order_sys!(X, params, t)
    # extract the parameters
    τ = params.τ
    ζ = params.ζ

    # extract the state
    x = X[1]
    x_dot = X[2]
    
    x_ddot = second_order_sys!(t,x,x_dot; τ=τ,ζ=ζ,u=u)

    return SVector{2}([x_dot, x_ddot])
end

App() do session
    tau_slider = Slider(0.1:0.1:10.)
    zeta_slider = Slider(0.:0.1:1.)

    # variables
    t = MallocVector{Float64}(undef,1000)
    y1 = MallocVector{Float64}(undef,1000)

    # Second order system 
    X0 = SVector{2}([0., 0.])
    tspan = (0.0, 5.0)
    parameters = (;τ=0.2, ζ=0.8)
    
    prob2 = ODEProblem(second_order_sys!, X0, tspan, parameters)

    # plotting
    fig = Figure(resolution=(800,600))
    ax = Axis(fig[1, 1], 
        limits=(tspan[1], tspan[2], 0, 2.),
        title="First order response",
        titlefont=:regular,
        titlesize=30,
        xlabelsize=25,
        ylabelsize=25,
        xticklabelsize=25,
        yticklabelsize=25)

    x_vec = Observable{Vector{Float64}}([0.])
    y_vec = Observable{Vector{Float64}}([0.])

    lines!(ax, x_vec, y_vec)

    slider_grid_1 = DOM.div("Time Constant: ", tau_slider, tau_slider.value)
    slider_grid_2 = DOM.div("Damping Ratio: ", zeta_slider, zeta_slider.value)

    # interactions
    app = map(tau_slider.value, zeta_slider.value) do val, zeta_val
        params = (;τ=Float64(val) , ζ=Float64(zeta_val))

        integ = DiffEqGPU.init(GPUTsit5(), prob2.f, false, X0, 0.0, 0.005, params, nothing, CallbackSet(nothing), true, false)

        for i in Int32(1):Int32(1000)
            t[i] = integ.t
            y1[i] = integ.u[1]
            
            @inline DiffEqGPU.step!(integ, integ.t + integ.dt, integ.u)
          
        end
        
        x_vec[] =  t
        y_vec[] =  y1
    end

    return JSServe.record_states(session,  DOM.div(fig, slider_grid_1, slider_grid_2))
    
end

```
\end{showhtml}


\end{section}

<!-- \begin{showhtml}{}

```julia
#hideall

using StaticArrays
using DiffEqGPU, OrdinaryDiffEq
using WGLMakie
using Markdown
using JSServe
using StaticTools
import JSServe.TailwindDashboard as D
using GeometryBasics
using FileIO

function meshcube(o=Vec3f(0), sizexyz=Vec3f(1))
    uvs = map(v -> v ./ (3, 2), Vec2f[
        (0, 0), (0, 1), (1, 1), (1, 0),
        (1, 0), (1, 1), (2, 1), (2, 0),
        (2, 0), (2, 1), (3, 1), (3, 0),
        (0, 1), (0, 2), (1, 2), (1, 1),
        (1, 1), (1, 2), (2, 2), (2, 1),
        (2, 1), (2, 2), (3, 2), (3, 1),
    ])
    m = normal_mesh(Rect3f(Vec3f(-0.5) .+ o, sizexyz))
    m = GeometryBasics.Mesh(meta(coordinates(m);
            uv=uvs, normals=normals(m)), faces(m))
end

App() do session
    slider = Slider(0.1:0.1:10)
    menu = D.Dropdown( "",[sin, tan, cos])
    cmap_button = D.Button("change colormap")
    textfield = D.TextField("type in your text")

    inp_1 = D.NumberInput(0.0)
    inp_2 = D.NumberInput(0.0)
    inp_3 = D.NumberInput(0.0)

    cmap = map(cmap_button) do click
    end

    value = map(slider.value) do x
        # return x ^ 2
    end

    # load mesh 
    crazyflie_stl = load(assetpath(String(@__DIR__) * "/assets/cf2_assembly.obj"))

    # plot cube volume 
    bbox_length = 2
    bbox_width = 2
    bbox_height = 2

    # add floor
    floor_width = 50
    floor_mesh = meshcube(Vec3f(0.5, 0.5, 0.46), Vec3f(bbox_length, bbox_width, 0.01))

    # # show quad 
    # fig = mesh(crazyflie_stl, figure = (resolution = (1200, 1000),))

    fig2 = Figure(resolution = (1200, 1200))
    pl = PointLight(Point3f(0), RGBf(20, 20, 20))
    al = AmbientLight(RGBf(0.2, 0.2, 0.2))
    lscene = LScene(fig2[1, 1], show_axis=false, scenekw = (lights = [pl, al], backgroundcolor=:white, clear=true))
    zoom!(lscene.scene, cameracontrols(lscene.scene), 3)
    update_cam!(lscene.scene, cameracontrols(lscene.scene))

    # now you can plot into lscene like you're used to
    mesh!(crazyflie_stl)

    # # show floor
    # floor = mesh!(floor_mesh; color=:green, interpolate=false)
    # translate!(floor, Vec3f(-bbox_length / 2, -bbox_width / 2, 0))

    slider_grid = DOM.div("z-index: ", slider, slider.value)
    
    return JSServe.record_states(session, DOM.div(fig2, slider_grid, menu, DOM.div("x: ",inp_1, "y: ",inp_2 , "z: ",inp_3)))
end

```
\end{showhtml} -->


\begin{section}{}

## Examples

### Autonomous cars

1. **Cruise Control:** Only the velocity needs to be regulated (one state variable). So, first order model is enough

### Quadcopters

1. **BLDC Motor modelling:** Actually a second order system, but behaves like a first order system due to the high bandwidth (quick response) of the BLDC motor system. Simpler, just one parameter to fit the model (time constant). Widely used in quadcopter simulations ([link to fig source] (https://github.com/uzh-rpg/rpg_quadrotor_control/blob/master/documents/theory_and_math/theory_and_math.pdf) )

![BLDC first order model](/assets/images/first_order_bldc.png)

2. **Cascaded control architecture:** Due to the first order dynamics of the BLDC motors, the attitude dynamics also have first order behaviour. So, attitude commands can be tracked using tight PID loops at high rates (eg. 500 Hz) with feedback from the gyro and accelerometer. The position control loop can run much slower since it has much slower second order dynamics (eg. 50 Hz)


# Simulation

## Choice of Simulator

There's no one size fits all simulator. If you're using ROS Gazebo is probably the most convenient one, since it's well integrated into the ROS ecosytem. However, you'll quickly run out of luck if you want to do photorealistic simultion. A game engine like Unreal / Unity would be your best bet here. Similary, you might have to write your own dynamics simulator for specific requirements such as accuarate contact dynamics. Running lots of parallel simulations on the GPU would require another simulator like Nvidia Issac Gym or a custom solution. 

## Simulator vs Visualizer

It's important to differentiate between the two. Eg. Gazebo is a simulator (physics engine + visualizer), while RViz is jst a visualizer. Simulators can also be shipped without a visualizer ,ie, just the physics engine. In some cases (eg. computer vision), the visualization might be part of the simulation.

## Choice of Integrator Algorithm and Implementation

* Euler forward is the the simplest, but unstable 
* Runga-Kutta 4th order (RK4) is a bit more complcated, but is mich more accurate
* Much fancier algorithms exist (eg. Rosenbrock for stiff ODE's) but RK4 gets the job done most of the time. Popular ODE solvers such Matlab ODE45, scipy ODEint, DIfferentialEquations.jl etc use some fancy version of Rk4 (eg. with adaptive timestepping) as the default algorithm.

## Lockstep Simulation

The simulator and autonomy stack wait for messages from each other. Can be used to emulate an RTOS (realtime operating system) based autonomy stack (eg. on a microcontroller) that performs tasks in hard real time, on a non-realtime operating system (eg. linux, windows). Also, this ensures that the simulations are repeatable since messages are never missed.

## In the loop simulation 

### Software in the Loop (SITL)

The actual software stack running on the robot is used for the simulation. New algorithms are typically written in a high level language like C++/python while prototyping. Then, it's ported to a faster low level language like C/C++. SITL simulaitions can be used to validate the real world software stack without actually testing it on the physical hardware

### Processor in the loop (SITL)

In SITL simulations, all code is usually executed on the development machine. However, the computing platfroms used on the robot might have severe limitations due to their embedded nature (eg. small flash size,stack overflow etc for microcontrollers). There's a chance that code working correctly on the development machine doesn't work on the onboard computer. To test this, the autonomy stack is run on the onboard computer during simulation. 

## Hardware in the Loop Simulation (HITL)

It refers to any simulation that involves hardware. The previously mentioned processor in loop simulation is also an example of HITL simulation.

# Systems Engineering and Architecture

Architecture is design, and design is art. Much better to explain it using a case study basis. Will as reference paper by Lupashin et al describing the architecure of the Flying Machine Arena (FMA). Well written, contains wealth of information  

## Everything is a tradeoff

* There's no free lunch in systems engineering. Every decision that you take to improve one aspect will be detrimental to some other aspect. Let's look at a few examples: 

a) The older version of the had a Raspberry Pi instead of the Nvidia Jetson. The Jetson is better for image processing (especially ML based) but what's the downside ? Shorter battery life (3-5 W vs 7-15 W) comparison and higher cost (4x higher). These factors not critical for a toy platform duckiebot, but super-important in real life applications. Many of the readers might be familiar with the company Zipline that uses autonomous drones to develop medical supplies. Their flagship platform only a low microcontroller as the flight computer (no high level computers like Raspberry Pi of Jetson). This means that it has much less computing power than the duckibot !. To be fair, it doesn't have cameras, so no heavy image processing. But powerful control methods such as MPC would require something like a Raspberry Pi. So, why stick with the microcontroller when using a Raspberry Pi would enable much better controllers ? Well, you alrready know the answer. The are fighting fro grams and milliwatts to increase the range. Each additional kilometer gained results in a bunch of lives saved.

 b) For most robotic systems, the IMU connectected to to microcontroller, which in turn connected to the onboard computers.The duckiebot follows the same pattern. The IMU communicates via SPI, which is supported by the Jetson a. So, why not conect it to the Jetson directly ?

<!-- ## Trade design study 

Compare factors against each other

## Modularity

* Both and hardware level and software level.For project, all of the hardware and most of the software already provided. Your code would most likely be a couple of nodes that add on to the exsiting software infrastructure. It's worth studying the system architecture for two reasons. You will need to know how the submodules are connected to do the project
* 

## Hardware 

* Not much you can do here, hardware is already

## Co-Design -->

# Resources

### Real world systems

1. [Raffaelo D'Andrea's talk on Robustness] (https://www.youtube.com/watch?v=_47JnJeSDFU)
2. [Brian Douglas's playlist on control systems in practice] (https://www.youtube.com/playlist?list=PLn8PRpmsu08pFBqgd_6Bi7msgkWFKL33b)

### Systems engineering

1. [Brian Douglas's playlist on systems engineering](https://www.youtube.com/playlist?list=PLn8PRpmsu08owzDpgnQr7vo2O-FUQm_fL)
2. [Gentry Lee's talk at NASA](https://www.youtube.com/watch?v=E6U_Ap2bDaE)

### Control theory

1. [Steve Brunton's control bootcamp](https://www.youtube.com/playlist?list=PLMrJAkhIeNNR20Mz-VpzgfQs5zrYi085m)
2. [Brian Douglas's playlist on classical control](https://www.youtube.com/playlist?list=PLUMWjy5jgHK1NC52DXXrriwihVrYZKqjk)
3. [Brian Douglas's playlist on state-space control] (https://www.youtube.com/watch?v=hpeKrMG-WP0&list=PLfqhYmT4ggAtpuB1g8NbgH912PwYjn_We)

### State Estimation

1. [Tucker McClure's blog] (https://link-url-here.org)

<!-- # Failsafes 

Anything that can fail will fail -->

\end{section} 


