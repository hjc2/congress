


float distancePointToLine(float x1, float y1, float x3, float y3, float x4, float y4) {
  // Calculate the components of the line segment
  float dx = x4 - x3;
  float dy = y4 - y3;
  
  // Calculate the squared length of the line segment
  float segmentLengthSquared = dx*dx + dy*dy;
  
  // If the line segment is of zero length, return the distance from the point to one of the endpoints
  if (segmentLengthSquared == 0) {
    return sqrt(sq(x1 - x3) + sq(y1 - y3));
  }
  
  // Calculate the parametric value of the projection of the point onto the line
  float t = ((x1 - x3) * dx + (y1 - y3) * dy) / segmentLengthSquared;
  
  // Clamp t to the range [0, 1]
  t = max(0, min(1, t));
  
  // Calculate the coordinates of the projection point
  float projectionX = x3 + t * dx;
  float projectionY = y3 + t * dy;
  
  // Calculate the distance from the point to the projection point
  float distance = sqrt(sq(x1 - projectionX) + sq(y1 - projectionY));
  
  return distance;
}
