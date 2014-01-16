
exports.run = (n, t) ->
  console.log "t\tInput\tOutput"
  while n.t < t
    console.log "#{n.t}\t#{n.input().join(" ")}\t#{n.output().join(" ")}"
    n.next()

