class Prenda{
	const precioBase 
	const tipoPrenda
	const estado
	
	method calcularPrecioPrenda() = estado.precioPrenda(precioBase)
		
}

class EstadoDePrenda{
	method precioPrenda(precioBase) 
	
}

class Nueva inherits EstadoDePrenda{
	override method precioPrenda(precioBase) = precioBase
}

class Promocion inherits EstadoDePrenda{
	var valorARestar
	
	override method precioPrenda(precioBase) = precioBase - valorARestar
}

class Liquidacion inherits EstadoDePrenda{
	
	override method precioPrenda(precioBase) = precioBase * 0.5
}


class Venta{
	var property prendas = []
	var property fecha
	var metodoPago
	
	var property subTotalPrendas = prendas.sum{prenda=> prenda.calcularPrecioPrenda()}
	
	method cantidadPrendas() = prendas.length()
	
	
	method precioFinal() = metodoPago.precioTotal(subTotalPrendas, prendas)
}

class MetodoPago{
	method precioTotal(precioTotalPrendas, prendas) 
	
}
class Efectivo inherits MetodoPago{
	override method precioTotal(precioTotalPrendas, prendas) = precioTotalPrendas
}

class Tarjeta inherits MetodoPago{
	const cantidadCuotas
	const coeficiente
	
	override method precioTotal(precioTotalPrendas, prendas) = cantidadCuotas * coeficiente + self.porcentajeDelValorDePrendas(prendas)

	method porcentajeDelValorDePrendas(prendas) = prendas.sum{prenda=> prenda.calcularPrecioPrenda()}
}

class Macowins{
	var ventas = []
	
	method ventasPorDia(dia) = ventas.filter{venta=> venta.fecha() == dia}
	
	method gananciasPorDia(dia) = self.ventasPorDia(dia).sum{venta=> venta.precioFinal()}
	
}