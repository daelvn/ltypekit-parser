import binarize, rbinarize, compare, annotatePar, annotate from require "ltypekit-parser"
import p, y                                                from require "ltypekit-parser.config"

p y rbinarize "(test) Tree a, b -> x"
p y (compare rbinarize "Tree a => a, b -> x") rbinarize "Tree y => a,b->x"
p y rbinarize "(map) (a -> b) -> [a] -> [b]"
p y (compare rbinarize "(map) (a -> b) -> [a] -> [b]") rbinarize "(map') (b -> c) -> [b] -> [c]"
p y (compare rbinarize "(map) Eq a => (a -> b) -> [a] -> [b]") rbinarize "(map') Ord b => (b -> c) -> [b] -> [c]"

p y rbinarize "(map') (a -> b) -> (c -> d) -> {a:b} -> {c:d}"
p (compare rbinarize "(invert) {a:b} -> {b:a}") rbinarize "(invert') {k:v} -> {v:k}"
p (compare rbinarize "(invert) Eq a => {a:b} -> {b:a}") rbinarize "(invert') Eq k => {k:v} -> {v:k}"
p (compare rbinarize "(invert) Eq a => {a:b} -> {b:a}") rbinarize "(invert') Ord k => {k:v} -> {v:k}"
p annotatePar "String", {"Eq String"}
p annotatePar "a", {"Ord a"}
p annotatePar "b", {}
p y ((annotate rbinarize "() (a -> b) -> [a] -> [b]") rbinarize "() (Int -> String) -> [Int] -> [String]") {}
p "fromMaybe", y rbinarize "(fromMaybe) a -> Maybe a -> a"
p "isJust", y rbinarize "(isJust) Maybe a -> Boolean"
p "Just", y rbinarize "(Just) a -> Maybe a"
p y rbinarize "a -> (a -> c) -> c"
p y binarize "Eq Ord a, Ord a => a -> a"
p y rbinarize "f (b -> b) -> f b"
