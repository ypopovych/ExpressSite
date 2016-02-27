//===--- main.swift -------------------------------------------------------===//
//
//Copyright (c) 2015-2016 Daniel Leping (dileping)
//
//This file is part of Swift Express Site.
//
//Swift Express Site is free software: you can redistribute it and/or modify
//it under the terms of the GNU Affero General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//Swift Express Site is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU Affero General Public License for more details.
//
//You should have received a copy of the GNU Affero General Public License
//along with Swift Express Site.  If not, see <http://www.gnu.org/licenses/>.
//
//===----------------------------------------------------------------------===//

import Express

let app = express()

app.views.register(StencilViewEngine())

app.get("/:file+", action: StaticAction(path: "public", param:"file"))

app.get("/") { request in
    let context:[String: Any] = [
        "title": siteTitle("Swift Web Application Framework"),
        "navbar": siteNavbar("home"),
        "tabs": tabs,
        "features": features
    ]
    return Action.render("index", context: context)
}

app.listen(9999).onSuccess { server in
    print("Express was successfully launched on port", server.port)
}

app.run()