### Description
This playground demonstraite flips of content bug in SpriteKit SKView CAMetalLayer framebufferOnly.

### Problem
This code cause flip content by Y:
```
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
...
(sceneView.layer as? CAMetalLayer)?.framebufferOnly = false
```

### Solve
```
sceneView.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: -1.0)
```