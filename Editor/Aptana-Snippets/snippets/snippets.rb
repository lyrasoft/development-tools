require 'ruble'

# DB

snippet t(:getDbo ) do |snip|
    snip.trigger = "getDbo"
    snip.expansion = '\$db = JFactory::getDbo();'
end

snippet t(:getQuery) do |snip|
    snip.trigger = "getQuery"
    snip.expansion = '\$q = \$db->getQuery(true) ;'
end

snippet t(:setQuery) do |s|
  s.trigger = 'setQuery'
  s.expansion = '\$db->setQuery(\$q) ;'
end

snippet t(:select) do|s|
  s.trigger = 'select'
  s.expansion = 
  '\$q->select("${1:*}")
  ->from("${2:*}")
  ->where("${3:*}")
  ->order("${4:*}")
  ;'
end

snippet t(:loadObjectList) do|s|
  s.trigger = 'loadObjectList'
  s.expansion = '\$result = \$db->loadObjectList();'
end

# Factory

snippet t(:getApplication) do|s|
  s.trigger = 'getApplication'
  s.expansion = '\$app = JFactory::getApplication() ;'
end

snippet t(:getDate) do|s|
  s.trigger = 'getDate'
  s.expansion = '\$date = JFactory::getDate( \'now\' , JFactory::getConfig()->get(\'offset\') ) ;'
end

snippet t(:getDocument) do|s|
  s.trigger = 'getDocument'
  s.expansion = '\$doc = JFactory::getDocument();'
end

snippet t(:getURI) do|s|
  s.trigger = 'getURI'
  s.expansion = '\$uri = JFactory::getURI() ;'
end

snippet t(:getUser) do|s|
  s.trigger = 'getUser'
  s.expansion = '\$user = JFactory::getUser() ;'
end

# Request

snippet t(:getVar) do|s|
  s.trigger = 'getVar'
  s.expansion = '\$${1:var} = JRequest::getVar(\'${2:var}\') ;'
end

snippet t(:setVar) do|s|
  s.trigger = 'setVar'
  s.expansion = 'JRequest::setVar( \$${1:key}, \$${2:value}, \'${3:method}\', ${4:true}) ;'
end


# mootools

snippet t(:addEvent) do|s|
  s.trigger = 'addEvent'
  s.expansion = 'window.addEvent(\'domready\', function(){
   });
  '
end

# debug

snippet t(:jexit) do |s|
  s.trigger = 'jexit'
  s.expansion = 'jexit("${1:Something error!!}") ;'
end

snippet t(:show) do |s|
  s.trigger = 'show'
  s.expansion = 'AK::show(\$${1:params}) ;'
end

# inline

snippet t(:echo) do |s|
  s.trigger = 'echo'
  s.expansion = '<?php echo \$${1:var} ; ?>'
end

snippet t(:foreach) do |s|
  s.trigger = 'foreach'
  s.expansion = '<?php foreach(\$${1:values} as \\$${2:value}): ?>'
end

snippet t(:endforeach) do |s|
  s.trigger = 'inendforeach'
  s.expansion = '<?php endforeach; ?>'
end

snippet t(:if) do |s|
  s.trigger = 'if'
  s.expansion = '<?php if(\$${1:var}) : ?>'
end

snippet t(:elseif) do |s|
  s.trigger = 'elseif'
  s.expansion = '<?php else if(\$${1:var}) : ?>'
end

snippet t(:endif) do |s|
  s.trigger = 'endif'
  s.expansion = '<?php endif ; ?>'
end

snippet t(:jversion) do |s|
  s.trigger = 'jversion'
  s.expansion = '<?php if(JVERSION >= 3) : ?>'
end


snippet t(:jtext) do |s|
  s.trigger = 'jtext'
  s.expansion = '<?php echo JText::_(\'${1:text}\'); ?>'
end

# Use Commands > Bundle Development > Insert Bundle Section > Snippet
# to easily add new snippets