<?php
#parse("PHP File Header.php")

#if (${NAMESPACE})

namespace ${NAMESPACE};
#end

use PHPUnit\Framework\TestCase;

/**
 * The ${NAME} class.
 * 
 * @since  {DEPLOY_VERSION}
 */
class ${NAME} extends TestCase
{
    /**
     * Test instance.
     *
     * @var object
     */
    protected $instance;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @return void
     */
    protected function setUp()
    {
        $this->instance = null;
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     *
     * @return void
     */
    protected function tearDown()
    {
    }
}
