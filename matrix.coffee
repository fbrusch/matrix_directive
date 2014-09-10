app = angular.module "matrix", []
app.directive "matrix", ($compile) ->
    scope:
        rows: "="
        cols: "="
        cont: "=content"
    restrict: "E"
    link: (scope, element, attrs) ->
        createMatrix = ->
            element.empty()
            e = document.createElement("table")
            e.className = e.className + " matrix"
            for j in [0..parseInt(scope.rows)-1]
                r = document.createElement("tr")
                for i in [0..parseInt(scope.cols)-1]
                    d1 = angular.element("<td></td>")
                    d1.addClass "{{cont[#{j*scope.rows+i}]}}"
                    d = $compile(d1)(scope)
                    angular.element(r).append d
                angular.element(e).append r
            element.prepend(e)
         
        scope.$watch "rows", ->
            createMatrix()
        scope.$watch "cols", ->
            createMatrix()
