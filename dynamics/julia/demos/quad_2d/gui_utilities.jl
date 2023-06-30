# convert standrard quaternion, euler angle to makie quaternin type
function to_makie_quaternion(R_quat::QuatRotation)::Quaternion
    return  Quaternion(R_quat.q.s, R_quat.q.v1,R_quat.q.v2,R_quat.q.v3)
end

function to_makie_quaternion(R_euler::RotZYX)::Quaternion
    
    # Convert the rotation to unit quaternion
    R_quat = QuatRotation(R_euler)
    
    return  Quaternion(R_quat.q.s, R_quat.q.v1,R_quat.q.v2,R_quat.q.v3)
end