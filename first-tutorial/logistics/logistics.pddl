(define (domain logistics)

(:requirements :strips :typing)

(:types city place physobj -object
    package vehicle -physobj
    truck airplane -vehicle
    airport location -place

)

(:predicates 
    (in-city ?loc - place ?city -city)
    (at ?obj -physobj ?loc - place)
    (in ?pkg -package ?veh -vehicle)
)

(:action load-truck
    :parameters (?pkg - package ?truck -truck ?loc -place)
    :precondition (and (at ?truck ?loc) (at ?pkg ?truck))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?truck))
)

(:action load-airplane
    :parameters (?pkg - package ?airplane -airplane ?loc - place)
    :precondition (and (at ?pkg ?loc) (at ?airplane ?loc))
    :effect (and (in ?pkg ?airplane) (not (at ?airplane ?loc)))

)

(:action unload-truck
    :parameters (?pkg - package ?truck -truck ?loc -place)
    :precondition (and (at ?truck ?loc) (in ?pkg ?truck))
    :effect (and (not (in ?pkg ?truc)) (at ?pkg ?loc))
)

(:action unload-airplane
    :parameters (?pkg - package ?airplane -airplane ?loc - place)
    :precondition (and (in ?pkg ?airplane) (at ?airplane ?loc))
    :effect (and (at ?pkg ?loc) (not (in ?pkg ?airplane)))
)

(:action fly-airplane
    :parameters (?airplane -airplane ?loc-from - airport ?loc-to - airport)
    :precondition (at ?airplane ?loc-from)
    :effect (and (not (at ?airplane ?loc-from)) (at ?airplane ?loc-to))
)

(:action drive-truck
    :parameters (?truck -truck ?loc-from - place ?loc-to - place ?city -city)
    :precondition (and (at ?truck ?loc-from) (in-city ?loc-from ?city) (in-city ?loc-to ?city))
    :effect (and (not (at ?truck ?loc-from)) (at ?truck ?loc-to))
)

)