import React from "react";
import * as ReactDOM from "react-dom/client";
import {
  createBrowserRouter,
} from "react-router-dom";
import { App } from "./App";
import { Error } from "./Error";
import { Player } from "./Player";

export const router = createBrowserRouter([
  {
    path: '/',
    errorElement: <Error />,
    children: [
      {
        path: "",
        element: <App />
      },
      {
        path: "nba_pool/:player_id",
        element: <Player />
      }
        
    ]
  }
])

