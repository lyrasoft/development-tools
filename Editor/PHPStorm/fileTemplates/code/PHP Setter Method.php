/**
 * Method to set property ${FIELD_NAME}
 * 
 * @param   ${TYPE_HINT}  $${PARAM_NAME}
 *
#if (${STATIC} == "static")
 * @return  void
#else
 * @return  static  Return self to support chaining.
#end
 *
 * @since  __DEPLOY_VERSION__
 */
public ${STATIC} function set${NAME}($${PARAM_NAME})
{
#if (${STATIC} == "static")
    static::$${FIELD_NAME} = $${PARAM_NAME};
#else
    $this->${FIELD_NAME} = $${PARAM_NAME};
    
    return $this;
#end
}
