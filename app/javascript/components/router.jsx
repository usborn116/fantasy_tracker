import React from "react";
import * as ReactDOM from "react-dom/client";
import {
  createBrowserRouter,
} from "react-router-dom";
import { App } from "./App";
import { Error } from "./Error";
import { Player } from "./Player";
import { Login } from "./Login";
import { Confirmation  } from "./Confirmation";

export const router = createBrowserRouter([
  {
    path: '/',
    element: <App />,
    errorElement: <Error />,
    children: [
      {
        path: "nba_pool/:player_id",
        element: <Player />
      },
      {
        path: "login",
        element: <Login />
      },
      {
        path: "confirmation/:id/:token",
        element: <Confirmation />
      },
        
    ]
  }
])

