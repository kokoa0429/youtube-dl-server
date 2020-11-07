const express = require("express")
const cors = require("cors")
const { exec } = require('child_process')
const app = express()

app.use(cors());

app.get("/", function (req, res) {
  let rege = /\?v=([^&]+)/
  if(!req.query.u) {
    res.json({
      success: false
    })
    return
  }
  const yUrl = req.query.u.match(rege)[1]
  exec('youtube-dl -f bestvideo+bestaudio -o output/%(title)s-%(id)s.%(ext)s https://www.youtube.com/watch?v='+ yUrl, (err, stdout, stderr) => {
      if (err) {
        res.send(`stderr: ${stderr}`)
        return
      }
      res.send(`stdout: ${stdout}`)
    }
  )
});

const server = app.listen(3333, function () {
  //const host: string = server.address()?.host;
  const port = (server.address()).port;
  console.log("listening at port " + port);
});
// なんかよくわからんエラーのログだすやつ
process.on("uncaughtException", console.error);
