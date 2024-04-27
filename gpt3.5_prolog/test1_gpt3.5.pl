You provided the Prolog facts and predicates to model the scenario, but there could be different answers to the query depending on any further set of facts existing in the database regarding dislike for chili. In your current model, you've essentially assumed that disliking both peppers and sweets implies that the person also dislikes chili. However, unless explicitly stated, there is no inherent reason for this to be true. 
Hence, we cannot validate that the answer 'Some Cantonese like neither peppers nor sweets' will guarantee the argument 'Some Cantonese don't like chili, so some southerners don't like chili' just with the existing facts and queries. 
To tune the adaptation to truth, we could add dislike for chili to the facts for 'sam', for example, like:
dislike_chili(sam).
Then, running your final query, will correctly return "sam" as an answer if the query is being asked:
?- guarantee_statement(Who).
I hope this clarification fits your needs. If you have more precise instructions or constraints, feel free to ask, and I will be glad to help you. 
