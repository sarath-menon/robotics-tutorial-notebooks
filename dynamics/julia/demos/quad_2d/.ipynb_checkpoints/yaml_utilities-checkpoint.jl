# recursive function to converted nested dict to nested NamedTuple

function recursive_dict_to_namedtuple(val)
    if typeof(val) == Dict{Symbol, Any}
        tuple =  NamedTuple((Symbol(key), recursive_dict_to_namedtuple(value)) for (key,value) in val)
        return tuple
    else
        return val
    end
end