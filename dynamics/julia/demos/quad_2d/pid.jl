mutable struct PID2
    kp::Float64 # proportional gain
    ki::Float64 # integral gain
    kd::Float64 # derivative gain

    k_aw::Float64 # integral antiwindup gain

    Ts::Float64 # sampling time
    
    error_integral::Float64 # integral accumulated over time
    prev_error::Float64 # error from prvious time step

    function PID2(;kp=kp, ki=ki, kd=kd, k_aw=k_aw, Ts=Ts)
        new( kp, ki, kd, k_aw, Ts, 0., 0.)
    end
    
end

PID = PID2

