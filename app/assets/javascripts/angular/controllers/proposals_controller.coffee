ProposalsCtrl = ($scope, $routeParams, $location, Proposal, HubSelected, HubProposals) ->
  $scope.filterSelection = $routeParams.filter
  $scope.hubSelection = HubSelected
  $scope.proposals = HubProposals

  Proposal.get(id: $routeParams.id)

  $scope.hubProposals = Proposal.query
    filter: $routeParams.filter
    hub: $routeParams.search

  $scope.setFilter = (filterSelected) ->
    $location.search('filter', filterSelected)

  submitHubSearch = ->
    angular.copy($scope.hubProposals, HubProposals)

  $scope.$watch('hubProposals', submitHubSearch, true)

ProposalsCtrl.$inject = ['$scope', '$routeParams', '$location', 'Proposal', 'HubSelected', 'HubProposals']
angularApp.controller 'ProposalsCtrl', ProposalsCtrl

ProposalsShowCtrl = ($scope, $routeParams, $location, Proposal, HubSelected, HubProposals) ->
  $scope.proposal = Proposal.get
    id: $routeParams.id
  , (proposal) ->
      #console.log(proposal.votes)
      $scope.filterSelection = $routeParams.filter
      $scope.hubSelection = HubSelected
      proposals = HubProposals
      #console.debug($scope.filterSelection)
      #console.debug($scope.hubSelection)
      console.debug(proposals.length)
      for proposal in proposals
        console.debug(proposal)



#      $scope.proposal = proposal

ProposalsShowCtrl.$inject = ['$scope', '$routeParams', '$location', 'Proposal', 'HubSelected', 'HubProposals']
angularApp.controller 'ProposalsShowCtrl', ProposalsShowCtrl
