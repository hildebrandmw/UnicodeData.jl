module UnicodeData

using Serialization

export udata

# Deserialized the dictionary built by the "build" step.
const serialized_path = joinpath(@__DIR__, "..", "deps", "unicode-dict.serial")
const CodepointDict = open(deserialize, serialized_path)


"""
udata(codepoint::T) where T <: Union{<:AbstractChar, <:Integer}) -> Union{String, Nothing}

Return a string containing information about `codepoint`. If `codepoint` has not been
assigned, return `nothing`.
"""
udata(x::UInt32) = get(CodepointDict, x, nothing)
udata(x::AbstractChar) = udata(codepoint(x))
udata(x::Integer) = udata(UInt32(x))


end # module
