# Inner Request-Driven Architecture (IRDA)

Inspired by Request-Driven Architecture (RDA) commonly used between clients and servers or microservices, this Proof of Concept (POC) implements a similar concept for use within an application.

This is decoupled approach to communicate between non-related features within an application.
The main idea is to have a central entity that receives requests and provides responses.
The requests themselves act as the interface between the components.

The Mailman serves as the request manager who receives requests and provides responses.
Services capable of handling requests are registered with the Mailman.

Advantages:
-	Decoupling: The only dependency between components is the Mailman.
-	Abstraction: All communication occurs through the Mailman. There’s no need to define explicit interfaces for implementation; the requests themselves act as the interface.
-	Circular dependencies free: Two services can depend on each other without creating circular dependencies, as the Mailman is the sole intermediary.
-	Testability: The Mailman is the only entity that needs to be mocked during testing.
