# Instance of 

> The 'instanceOf' operator allows to check if an instance belongs to a particular class or not.

> It also takes inheritance into account.

<code>
obj instanceOf class
</code>

> 'instanceOf' returns a boolean value.
> By the way, there’s also a method objA.isPrototypeOf(objB), that returns true if objA is somewhere in the chain of prototypes for objB. So the test of obj instanceof Class can be rephrased as Class.prototype.isPrototypeOf(obj).
