(define (problem p01)
        (:domain logistics)
)

(:objects plane -airplane
    truck - truck
    cdg lhr - airport
    north south - place
    london paris - city
    p1 p2 - package
)

(:init (in-city cgd paris)
    (in-city lhr london)
    (in-city north paris)
    (in-city south paris)
    (at plane lhr)
    (at p1 lhr)
    (at p2 lhr)
)

(:goal (and (at p1 north)
        (at p2 south))
)