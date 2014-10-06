# これなに

[OpenYo](https://github.com/nna774/OpenYo/) をコンテナにつめたもの。

# 必要なもの

* docker
* rake
* mysql-client

# 使いかた

````
$ git clone https://github.com/nna774/OpenYoServerConteiner.git
$ cd OpenYoServerConteiner
$ cp config.rb{.example,}
$ emacs config.rb # デフォルトでもある程度動く
$ rake
````

何事も無ければ、`http://localhost:9293/` がOpenYo のエンドポイントになってると思います。

````
$ rake test
````

で、テストできるかと思えば、私にYo が来るだけなのであまりテストになりません。
もし使うなら、`Rakefile` の`test` の二行目、`kayac_id=nona7` をあなたのim.kayac.com のid に書きかえてください。

# 何かおかしければ

Pull Request かissue をお願いします。
立てるほどでも無いことなら、[@nonamea774](http://twitter.com/nonamea774) か、[yo@nna774.net](yo@nna774.net) までおねがいします。
