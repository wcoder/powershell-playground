
param(
    $path
)

try {
   if ($path -eq './forbidden') {
     throw "Path not allowed"
   }
   # Carry on.

} catch {
   write-error "$($_.exception.message)" # Path not allowed.
}