<?php
#parse("PHP File Header.php")

#if (${NAMESPACE})

namespace ${NAMESPACE};
#end

use Windwalker\Console\Command\Command;

#parse("PHP Class Doc Comment.php")
class ${NAME} extends Command
{
    /**
     * Property name.
     *
     * @var  string
     */
    protected ${DS}name = '$name';

    /**
     * Property description.
     *
     * @var  string
     */
    protected ${DS}description = '$description';

    /**
     * The usage to tell user how to use this command.
     *
     * @var string
     *
     * @since  2.0
     */
    protected ${DS}usage = '%s <cmd><command></cmd> <option>[option]</option>';

    /**
     * The manual about this command.
     *
     * @var  string
     *
     * @since  2.0
     */
    protected ${DS}help;

    /**
     * Initialise command.
     *
     * @return void
     *
     * @since  2.0
     */
    protected function init()
    {
        parent::init();
    }

    /**
     * Execute this command.
     *
     * @return int
     *
     * @since  2.0
     */
    protected function doExecute()
    {
        return parent::doExecute();
    }
}
