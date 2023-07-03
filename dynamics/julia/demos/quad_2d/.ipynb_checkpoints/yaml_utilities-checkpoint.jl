# recursive function to converted nested dict to nested NamedTuple
function recursive_dict_to_namedtuple(val)
    if typeof(val) == Dict{Symbol, Any}
        named_tuple =  NamedTuple((Symbol(key), recursive_dict_to_namedtuple(value)) for (key,value) in val)
        return named_tuple
        
    elseif typeof(val) == Vector{Dict{Symbol, Any}}
        
        named_tuple_vec = NamedTuple[]
        for i in val
            named_tuple = recursive_dict_to_namedtuple(i)
            push!(named_tuple_vec, named_tuple)
        end
        return named_tuple_vec
        
    else
        return val
    end
end