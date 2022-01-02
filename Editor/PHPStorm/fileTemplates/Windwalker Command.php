<?php

#parse("PHP File Header.php")


declare(strict_types=1);

#if (${NAMESPACE})

namespace ${NAMESPACE};
#end

use Symfony\Component\Console\Command\Command;
use Windwalker\Console\CommandInterface;
use Windwalker\Console\CommandWrapper;
use Windwalker\Console\IOInterface;

#parse("PHP Class Doc Comment.php")
#[CommandWrapper(description: '')]
class ${NAME} implements CommandInterface
{
    public function configure(Command ${DS}command): void
    {
    }

    public function execute(IOInterface ${DS}io): int
    {
        return 0;
    }
}
