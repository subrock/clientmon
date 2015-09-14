# clientmon
New application to monitor client nodes from a central server. Server will communicate with an agent running on the client pulling down real-time system data. Server will serve that data via a secure REST API. 

Server 
- Pulls data from agent running on the client node. If it cannot reach agent node is marked as 'Unavailable'.
- If agent is running server marks client node as 'Running'
- If agent is running server will link agent data set to running node.
- Server must be able to see client nodes via specified open port.

Agent
- Checks health of operating system
- returns operating system information
- returns installed applications
- returns which applications are running
- Datasheet will be in the form of XML.

Web Client
- Connects to REST API and pulls XML data sheet which contains status  and client node information as defined above.
- Web client can be installed on a separatly from the server and does not have to see client nodes but must be able to see server.

Android Client
- Connects to REST API and pulls XML data sheet which contains status  and client node information as defined above.
- Android client does not need to see client nodes, only the server. 

