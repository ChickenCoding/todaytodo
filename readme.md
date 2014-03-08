# TodayTodo App

_development in pause, but you're free to pull/fork_

__TodayTodo__ is a getting things done module for [Tomatoes Together][tomatoestogether].

You need [NodeJS][nodejs] to install it.

## How to install

  + ``npm install`` to install dependencies

  + ``grunt`` to compile

## Structure

### Verbose description

  + ``/src/cs/tasks.coffee``

    + a ``task`` is basically a todo

    + ``taskList`` is an array of ``task``,

    + the sum of pomodoros and ``taskers`` for this ``taskList`` are put respectively 
    in ``totalPomodoros`` and ``totalTaskers``,

    + each ``task`` have its number of pomodoros,
    
    + each ``task`` have an array of ``memberList``, which represents the users
    assigned to the specific task,

  + ``/src/cs/members.coffee``
  
    + ``memberList`` is an array of ``member``,

    + ``member`` is a user

  + ``/src/cs/pomodoro.coffee``

    + a ``pomodoro`` is basically a tomato

    + each ``pomodoro`` have an assigned ``task``, linked by the task id


Copyright (C) 2014 ChickenCoding

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

[tomatoestogether]:http://github.com/dcolgan/tomatoestogether
[nodejs]:http://nodejs.org


