public ${STATIC} function set${NAME}(#if (${SCALAR_TYPE_HINT})${SCALAR_TYPE_HINT} #else#end$${PARAM_NAME})#if(${STATIC} != "static"): static#else: void#end
{
#if (${STATIC} == "static")
    static::$${FIELD_NAME} = $${PARAM_NAME};
#else
    $this->${FIELD_NAME} = $${PARAM_NAME};
    
    return $this;
#end
}
