/**
 * Prepare the data for direct usage by the client-end
 * Groups all the zones into a handful clusters,
 * grouped together by the distance to the respective homezones
 * @param {*} zones The original, non-grouped zones
 * @returns The grouped clusters
 */
function prepareData(zones) {
    if (zones === undefined || zones === null || zones.length === 0)
        return undefined
    
    var currentClusterIndex = 0
    var clusterDistances = [0.00, 0.55, 1.05, 2.05, 5.05, 10, 20]
    var clusters = []
    var accumulatedPercentage = 0
    var accumulatedPeople = 0
    zones.forEach(zone => {
        if (zone.distance !== 0 && zone.distance/1000 >= clusterDistances[currentClusterIndex]) {
            // save the values
            clusters[currentClusterIndex] = {
                percent: accumulatedPercentage,
                distance: Math.max(clusterDistances[currentClusterIndex]*1000-1, 0),
                people: Math.round(accumulatedPeople)
            }

            // reset the values
            currentClusterIndex++
            accumulatedPercentage = zone.percent
            accumulatedPeople = zone.people
        } else {
            accumulatedPercentage += zone.percent
            accumulatedPeople += zone.people
        }
    });
    
    let longestDistance = zones[zones.length-1].distance
    let magnitude = Math.pow(10, longestDistance.toFixed(0).length - 1)
    let dist = Math.ceil(2*longestDistance / magnitude) / 2 * magnitude
    clusters[currentClusterIndex] = {
        percent: accumulatedPercentage,
        distance: dist,
        people: Math.round(accumulatedPeople)
    }

    return clusters
}
