
/**
 * Route Interface
 *
*/

namespace Scene\Mvc\Router;

/**
 * Scene\Mvc\Router\RouteInterface
 *
 * Interface for Scene\Mvc\Router\Route
 */
interface RouteInterface
{
    
    /**
     * \Scene\Mvc\Router\Route constructor
     *
     * @param string pattern
     * @param array|null paths
     * @param array|string|null httpMethods
     */
    public function __construct(string! pattern, var paths = null, var httpMethods = null);

    /**
     * Replaces placeholders from pattern returning a valid PCRE regular expression
     *
     * @param string pattern
     * @return string
     */
    public function compilePattern(string! pattern) -> string;

    /**
     * Set one or more HTTP methods that constraint the matching of the route
     *
     * @param string|array httpMethods
     * @return \Scene\Mvc\Router\RouteInterface
     */
    public function via(var httpMethods) -> <RouteInterface>;

    /**
     * Reconfigure the route adding a new pattern and a set of paths
     *
     * @param string pattern
     * @param array|null paths
     */
    public function reConfigure(string! pattern, var paths = null) -> void;

    /**
     * Returns the route's name
     *
     * @return string
     */
    public function getName() -> string;

    /**
     * Sets the route's name
     *
     * @param string name
     * @return \Scene\Mvc\Router\RouteInterface
     */
    public function setName(string name) -> <RouteInterface>;

    /**
     * Sets a set of HTTP methods that constraint the matching of the route
     *
     * @param string|array httpMethods
     * @return \Scene\Mvc\Router\RouteInterface
     */
    public function setHttpMethods(var httpMethods) -> <RouteInterface>;

    /**
     * Returns the route's id
     *
     * @return string
     */
    public function getRouteId() -> string;

    /**
     * Returns the route's pattern
     *
     * @return string
     */
    public function getPattern() -> string;

    /**
     * Returns the route's pattern
     *
     * @return string
     */
    public function getCompiledPattern() -> string;

    /**
     * Returns the paths
     *
     * @return array
     */
    public function getPaths() -> array;

    /**
     * Returns the paths using positions as keys and names as values
     */
    public function getReversedPaths() -> array;

    /**
     * Returns the HTTP methods that constraint matching the route
     */
    public function getHttpMethods() -> string | array;

    /**
     * Resets the internal route id generator
     */
    public static function reset() -> void;

}