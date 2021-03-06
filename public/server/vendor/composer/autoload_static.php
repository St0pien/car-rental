<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitabaab689a88706f6478d126b6a2d2695
{
    public static $prefixLengthsPsr4 = array (
        'M' => 
        array (
            'Models\\' => 7,
        ),
        'C' => 
        array (
            'Controllers\\' => 12,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Models\\' => 
        array (
            0 => __DIR__ . '/../..' . '/models',
        ),
        'Controllers\\' => 
        array (
            0 => __DIR__ . '/../..' . '/controllers',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitabaab689a88706f6478d126b6a2d2695::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitabaab689a88706f6478d126b6a2d2695::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
