
/*
 +------------------------------------------------------------------------+
 |                       ___  ___ ___ _ __   ___                          |
 |                      / __|/ __/ _ \  _ \ / _ \                         |
 |                      \__ \ (_|  __/ | | |  __/                         |
 |                      |___/\___\___|_| |_|\___|                         |
 |                                                                        |
 +------------------------------------------------------------------------+
 | Copyright (c) 2015-2016 Scene Team (http://mcorce.com)                 |
 +------------------------------------------------------------------------+
 | This source file is subject to the MIT License that is bundled         |
 | with this package in the file docs/LICENSE.txt.                        |
 |                                                                        |
 | If you did not receive a copy of the license and are unable to         |
 | obtain it through the world-wide-web, please send an email             |
 | to scene@mcorce.com so we can send you a copy immediately.             |
 +------------------------------------------------------------------------+
 | Authors: DangCheng <dangcheng@hotmail.com>                             |
 +------------------------------------------------------------------------+
 */

namespace Scene\Cache\Frontend;

use Scene\Cache\FrontendInterface;

/**
 * Scene\Cache\Frontend\Base64
 *
 * Allows to cache data converting/deconverting them to base64.
 *
 * This adapter uses the base64_encode/base64_decode PHP's functions
 *
 *<code>
 *<?php
 *
 * // Cache the files for 2 days using a Base64 frontend
 * $frontCache = new \Scene\Cache\Frontend\Base64(array(
 *    "lifetime" => 172800
 * ));
 *
 * //Create a MongoDB cache
 * $cache = new \Scene\Cache\Backend\Mongo($frontCache, array(
 *      'server' => "mongodb://localhost",
 *      'db' => 'caches',
 *      'collection' => 'images'
 * ));
 *
 * // Try to get cached image
 * $cacheKey = 'some-image.jpg.cache';
 * $image    = $cache->get($cacheKey);
 * if ($image === null) {
 *
 *     // Store the image in the cache
 *     $cache->save($cacheKey, file_get_contents('tmp-dir/some-image.jpg'));
 * }
 *
 * header('Content-Type: image/jpeg');
 * echo $image;
 *</code>
 */
class Base64 implements FrontendInterface
{

    /**
     * Frontend Options
     *
     * @var null|array
     * @access protected
    */
    protected _frontendOptions;

    /**
     * Scene\Cache\Frontend\Base64 constructor
     *
     * @param array frontendOptions
     */
    public function __construct(frontendOptions = null)
    {
        let this->_frontendOptions = frontendOptions;
    }

    /**
     * Returns the cache lifetime
     */
    public function getLifetime() -> int
    {
        var options, lifetime;
        let options = this->_frontendOptions;
        if typeof options == "array" {
            if fetch lifetime, options["lifetime"] {
                return lifetime;
            }
        }
        return 1;
    }

    /**
     * Check whether if frontend is buffering output
     *
     * @return boolean
     */
    public function isBuffering() -> boolean
    {
        return false;
    }

    /**
     * Starts output frontend. Actually, does nothing in this adapter
     */
    public function start()
    {

    }

    /**
     * Returns output cached content
     *
     * @return string
     */
    public function getContent()
    {
        return null;
    }

    /**
     * Stops output frontend
     */
    public function stop()
    {

    }

    /**
     * Serializes data before storing them
     *
     * @param mixed data
     * @return string
     */
    public function beforeStore(var data) -> string
    {
        return base64_encode(data);
    }

    /**
     * Unserializes data after retrieval
     *
     * @param mixed data
     * @return mixed
     */
    public function afterRetrieve(var data) -> string
    {
        return base64_decode(data);
    }
}
