Advent of Code 2019 Day 18 Notes
================================

Strategy:

Upfront, we flood fill the dungeon starting from the entrance, recording several kinds of data:

 * given a thing, what things lie immediately beyond it
 * given a thing, the list of things that lie along the path to it from the entrance
 * distances

Our ultimate goal for part 1 is the minimal number of steps to reach all keys.  We'll choose a sequence (which is the order in which keys are reached), from which we can derive a path (listing each thing we cross, even while backtracking).  Mostly, the dungeon is a maze of twisty little passages and the recorded distances between things can just be summed up.  But things which are just beyond the entrance may have a route between them that doesn't cross the entrance, so we'll need to calculate their distances specially.

