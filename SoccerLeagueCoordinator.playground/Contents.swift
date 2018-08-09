//Create an array of players
var players: [[String:Any]] = []

//Create an array of experienced players
var experiencedPlayers: [[String:Any]] = []

//Create an array of inexperienced players
var inexperiencedPlayers: [[String:Any]] = []

//Create an array of teams to hold all teams
var teams: [[[String:Any]]] = []

//Create an array for each team to hold the players
var teamSharks: [[String:Any]] = []
var teamDragon: [[String:Any]] = []
var teamRaptors: [[String:Any]] = []

//Create an array of experienced players for each team
var teamSharksHeight: [Int] = []
var teamDragonHeight: [Int] = []
var teamRaptorsHeight: [Int] = []

//Create an array of letters
var letters:[String] = []

//Add team to pool of teams
teams.append(teamSharks)
teams.append(teamDragon)
teams.append(teamRaptors)

//Create players
let player1:[String:Any] = ["name":"Joe Smith","height":42,"hasExperience":true,"guardian":"Jim and Jan Smith"]
let player2:[String:Any] = ["name":"Jill Tanner","height":36,"hasExperience":true,"guardian":"Clara Tanner"]
let player3:[String:Any] = ["name":"Bill Bon","height":43,"hasExperience":true,"guardian":"Sara and Jenny Bon"]
let player4:[String:Any] = ["name":"Eva Gordon","height":45,"hasExperience":false,"guardian":"Wendy and Mike Gordon"]
let player5:[String:Any] = ["name":"Matt Gill","height":40,"hasExperience":false,"guardian":"Charles and Sylvia Gill"]
let player6:[String:Any] = ["name":"Kimmy Stein","height":41,"hasExperience":false,"guardian":"Bill and Hillary Stein"]
let player7:[String:Any] = ["name":"Sammy Adams","height":45,"hasExperience":false,"guardian":"Jeff Adams"]
let player8:[String:Any] = ["name":"Karl Saygan","height":42,"hasExperience":true,"guardian":"Heather Bledsoe"]
let player9:[String:Any] = ["name":"Suzane Greenberg","height":44,"hasExperience":true,"guardian":"Henrietta Dumas"]
let player10:[String:Any] = ["name":"Sal Dali","height":41,"hasExperience":false,"guardian":"Gala Dali"]
let player11:[String:Any] = ["name":"Joe Kavalier","height":39,"hasExperience":false,"guardian":"Sam and Elaine Kavalier"]
let player12:[String:Any] = ["name":"Ben Finkelstein","height":44,"hasExperience":false,"guardian":"Aaron and Jill Finkelstein"]
let player13:[String:Any] = ["name":"Diego Soto","height":41,"hasExperience":true,"guardian":"Robin and Sarika Soto"]
let player14:[String:Any] = ["name":"Chloe Alaska","height":47,"hasExperience":false,"guardian":"David and Jamie Alaska"]
let player15:[String:Any] = ["name":"Arnold Willis","height":43,"hasExperience":false,"guardian":"Claire Willis"]
let player16:[String:Any] = ["name":"Phillip Helm","height":44,"hasExperience":true,"guardian":"Thomas Helm and Eva Jones"]
let player17:[String:Any] = ["name":"Les Clay","height":42,"hasExperience":true,"guardian":"Wynonna Brown"]
let player18:[String:Any] = ["name":"Herschel Krustofski","height":45,"hasExperience":true,"guardian":"Hyman and Rachel Krustofski"]

//Add each player to the collection of players
players.append(player1)
players.append(player2)
players.append(player3)
players.append(player4)
players.append(player5)
players.append(player6)
players.append(player7)
players.append(player8)
players.append(player9)
players.append(player10)
players.append(player11)
players.append(player12)
players.append(player13)
players.append(player14)
players.append(player15)
players.append(player16)
players.append(player17)
players.append(player18)

//Separate experienced and inexperienced players
for player in players {
    if player["hasExperience"] as? Bool == true{
        experiencedPlayers.append(player)
    }else{
        inexperiencedPlayers.append(player)
    }
}

let playersPerTeam = players.count/teams.count
let experiencedPlayerPerTeam = experiencedPlayers.count/teams.count
let inexperiencedPlayerPerTeam = playersPerTeam - experiencedPlayerPerTeam

//Add experienced players to each team
for player in experiencedPlayers{
    if teamSharks.count < experiencedPlayerPerTeam{
        teamSharks.append(player)
    }else if teamDragon.count < experiencedPlayerPerTeam{
        teamDragon.append(player)
    }else if teamRaptors.count < experiencedPlayerPerTeam{
        teamRaptors.append(player)
    }
}

//Add the rest of the players to each team
for player in inexperiencedPlayers {
    if teamSharks.count < playersPerTeam{
        teamSharks.append(player)
    }else if teamDragon.count < playersPerTeam{
        teamDragon.append(player)
    }else if teamRaptors.count < playersPerTeam{
        teamRaptors.append(player)
    }
}

//Add each player's height to the correspondent team's height array
for player in teamSharks{
    if let playersHeight=player["height"] as? Int{
        teamSharksHeight.append(playersHeight)
    }
}

for player in teamDragon{
    if let playersHeight=player["height"] as? Int{
        teamDragonHeight.append(playersHeight)
    }
}

for player in teamRaptors{
    if let playersHeight=player["height"] as? Int{
        teamRaptorsHeight.append(playersHeight)
    }
}

//Calculate the team's average height
func average(teamsHeight: [Int]) -> Double {
    var totalHeight = 0.0
    for height in teamsHeight{
        totalHeight += Double(height)
    }
    let teamsHeight = Double(teamsHeight.count)
    let average = totalHeight/teamsHeight
    return average
}

//Store the average height for each team in a constant
let teamSharksAverageHeight = average(teamsHeight: teamSharksHeight)
let teamDragonAverageHeight = average(teamsHeight: teamDragonHeight)
let teamRaptorsAverageHeight = average(teamsHeight: teamRaptorsHeight)

//Print the teams
func printTeams(teamName name:String, roster players:[[String:Any]],teamAverageHeight aveHeight:Double){
    print("Team Name: \(name) \nNumber of experienced players: \(experiencedPlayerPerTeam) \nTeam height average: \(aveHeight) inches \nPlayers:")
    for player in players{
        if let playerName=player["name"]as?String{
            if player["hasExperience"]as?Bool == true{
                print("         \(playerName) (E)")
            }else{
                print("         \(playerName)")
            }
        }
    }
    print("\n")
}

printTeams(teamName: "Sharks", roster: teamSharks, teamAverageHeight: teamSharksAverageHeight)
printTeams(teamName: "Dragon", roster: teamDragon, teamAverageHeight: teamDragonAverageHeight)
printTeams(teamName: "Raptors", roster: teamRaptors, teamAverageHeight: teamRaptorsAverageHeight)

//Print letters
func generateGuardianLetter(forPlayer player:[String:Any],inTeam team:String,practiceTime time:String){
    if let playerName=player["name"]as?String{
        if let guardianName=player["guardian"]as?String{
            let letter = "\nDear \(guardianName), \nI wanted to inform you that \(playerName) will be joining team \(team).\nThe first day of practice is on \(time). I look forward to see \(playerName) at practice.\nSincerely,\n\(team)'s Coach\n"
            letters.append(letter)
        }
    }
}

for player in teamSharks{
    generateGuardianLetter(forPlayer: player,inTeam:"Sharks",practiceTime:"March 17, 3pm")
}
for player in teamDragon{
    generateGuardianLetter(forPlayer: player,inTeam:"Dragon",practiceTime:"March 17, 1pm")
}
for player in teamRaptors{
    generateGuardianLetter(forPlayer: player,inTeam:"Raptors",practiceTime:"March 18, 1pm")
}

print("****************************************** LETTERS *****************************************")
for letter in letters{
    print(letter)
}
