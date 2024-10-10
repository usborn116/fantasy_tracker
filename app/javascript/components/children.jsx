import React from "react";
import { Login } from "./Login"
import { Confirmation } from "./Confirmation"
import { Leagues } from "./indexComponents/Leagues"
import { Teams } from "./indexComponents/Teams";
import { Seasons } from "./indexComponents/Seasons";
import { TeamSeasons } from "./indexComponents/TeamSeasons";
import { Players } from "./indexComponents/Players";
import { Members } from "./indexComponents/Members";
import { DraftPicks } from "./indexComponents/DraftPicks";
import { Salaries } from "./indexComponents/Salaries"
import { League } from "./showComponents/League";
import { Team } from "./showComponents/Team";
import { Season } from "./showComponents/Season";
import { TeamSeason } from "./showComponents/TeamSeason";
import { Player } from "./showComponents/Player";
import { Me } from "./showComponents/Me";

export const children = [
      {
        path: "me",
        element: <Me />
      },
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
      {
        path: "leagues",
        element: <Leagues />
  },
      {
        path: "leagues/:league_id",
        element: <League />
  },
      {
        path: "leagues/:league_id/players/:player_id",
        element: <Player />
  },
      {
        path: "leagues/:league_id/teams",
        element: <Teams />
  },
      {
        path: "leagues/:league_id/teams/:team_id",
        element: <Team />
  },
      {
        path: "teams",
        element: <Teams />
  },
      {
        path: "teams/:team_id",
        element: <Team />
  },
      {
        path: "leagues/:league_id/seasons",
        element: <Seasons />
  },
      {
        path: "leagues/:league_id/seasons/:season_id",
        element: <Season />
  },
      {
          path: "leagues/:league_id/seasons/:season_id/draft_picks",
          element: <DraftPicks />
    },
      {
        path: "leagues/:league_id/members",
        element: <Members />
  },
      {
        path: "leagues/:league_id/teams/:team_id/team_seasons",
        element: <TeamSeasons />
  },
      {
          path: "leagues/:league_id/teams/:team_id/team_seasons/:team_season_id",
          element: <TeamSeason />
    },
      {
        path: "leagues/:league_id/teams/:team_id/players",
        element: <Players />
  },
      {
        path: "leagues/:league_id/teams/:team_id/players/:player_id",
        element: <Player />
  },
      {
        path: "leagues/:league_id/players/:player_id/salaries",
        element: <Salaries />
      },
        
]