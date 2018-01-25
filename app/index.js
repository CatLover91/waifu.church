import express from 'express'
import gm from 'gm'
import fs from 'fs'
import path from 'path'

const srcDir = '/waifus'
// const outDir = '/out'

const maxAge = 3153600
const exp = new Date(0)
const defaultExt = 'png'

gm.subClass({ imageMagick: true })

const app = express()

function getUrl (req) {
  let url = req.headers['X-Forwarded-Protocol'] ? 'https://' : 'http://'

  url += req.headers['host'] + req.url

  return url
}

app.use(express.static(path.join(__dirname, '/assets')))
// app.use(express.favicon())

// root index
app.get('/', (req, res) => {
  res.render('index', {
    url: getUrl(req)
  })
})

app.get('/:width/:height/:format?', (req, res) => {
  // configure request
  const ext = typeof req.params.format !== 'undefined' ? req.params.format : defaultExt

  res.setHeader('Content-Type', 'image/' + ext)
  res.setHeader('Cache-Control', 'public, max-age=' + maxAge)
  res.setHeader('Expires', exp)
  res.setHeader('Last-Modified', exp)

  // parse image

  const imgPath = 'test.png'

  const stream = fs.createReadStream(srcDir + imgPath)

  gm(stream, imgPath).stream().on('data', (chunk) => {
    res.write(chunk)
  }).on('end', (chunk) => {
    res.write(chunk)
  })
})

// 404 page
app.use((req, res) => {
  res.status('404').render('404', {url: getUrl(req)})
})

// 500 page
app.use((err, req, res) => {
  res.status(err.status || 500).render('500', {error: err})
})

app.listen(8080, () => {
  console.log('Listening on port 8080')
})
