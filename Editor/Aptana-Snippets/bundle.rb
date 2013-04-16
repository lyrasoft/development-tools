require 'ruble'

bundle do |bundle|
  bundle.display_name = t(:bundle_name)
  bundle.author = 'Jordan'
  bundle.copyright = <<END
(c) Copyright 2013 asikart.org. Distributed under MIT license.
END

  bundle.description = <<END
  This is for Aptana Joomla! snippets .
END

  # uncomment with the url to the git repo if one exists
  # bundle.repository = 'git@github.com:username/repo-name.git'

  # Use Commands > Bundle Development > Insert Bundle Section > Menu
  # to easily add new sections
  bundle.menu t(:bundle_name) do |menu|
    menu.menu 'Database' do |sub_menu|
        sub_menu.command t(:getDbo)
        sub_menu.command t(:getQuery)
        sub_menu.command t(:loadObjectList)
        sub_menu.command t(:select)
        sub_menu.command t(:setQuery)   
    end
    menu.menu 'Factory' do |sub_menu|
        sub_menu.command t(:getApplication)
        sub_menu.command t(:getDate)
        sub_menu.command t(:getDocument)
        sub_menu.command t(:getURI)
        sub_menu.command t(:getUser)
    end

    menu.menu 'Request' do |sub_menu|
      sub_menu.command t(:getVar)
      sub_menu.command t(:setVar)
    end
    menu.menu 'inline' do |sub_menu|
        sub_menu.command t(:echo)
        sub_menu.command t(:foreach)
        sub_menu.command t(:endforeach)
        sub_menu.command t(:if)
        sub_menu.command t(:elseif)
        sub_menu.command t(:endif)
        sub_menu.command t(:jversion)
        sub_menu.command t(:jtext)
    end
    menu.menu 'mootools' do |sub_menu|
       sub_menu.command t(:addEvent)
    end
    menu.menu 'Debug' do |sub_menu|
        sub_menu.command t(:jexit)
        sub_menu.command t(:show)
    end
    menu.separator
  end
end