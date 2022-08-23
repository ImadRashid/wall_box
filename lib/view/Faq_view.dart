import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_box/constants/Constants.dart';
import 'package:wall_box/widgets/systemItem.dart';

class Hife_Faq_view extends StatefulWidget {
  const Hife_Faq_view({Key,key}) : super(key: key);

  @override
  _Hife_Faq_viewState createState() => _Hife_Faq_viewState();
}

class _Hife_Faq_viewState extends State<Hife_Faq_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                height:90,
                width: sw,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${english?'Help':'Hife'} & FAQ',style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ExpansionTile(title: Text('LED-${english?'Signals':'Signale'}',style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Container(child: Icon(Icons.keyboard_arrow_down,color: Colors.white,),decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),),
              ),
              ExpansionTile(title: Text('FAQ',style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
                trailing: Container(child: Icon(Icons.keyboard_arrow_down,color: Colors.white,),decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          width: sw,
                          child: Row(
                            children: [
                             Flexible(
                                child: Text('Can my car be charged with this wall box?',maxLines:10,style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ],
                          ),
                        ),
                        Text('The wall box enables mode 3 AC charging and is equipped with a type 2 charging cable. If your vehicle is compatible with the Mode 3 charging process (which is actually possible with all e-vehicles with an integrated AC charger) and provides the Type 2 connector, then your vehicle can be charged with the wall box.',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),),
                        Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('Where is the best place for my wall box?',maxLines:10,style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ],
                          ),
                        ),
                        Text('The Wallbox should be installed in a place that is freely accessible and should be protected from direct sunlight. It is advisable to install a small weather protection roof outdoors, which protects the wall box from heavy rain and snow.The electrical connection must be carried out by a qualified electrician. A 5-wire cable (L1, L2, L3, neutral conductor and PE) for the electrical supply line should have at least 2.5mm², but depending on the length of the line it may have to be designed with a larger cross-section. An RCD type A must be installed externally in front of the Wallbox, preferably in the house distribution or in a sub-distribution; 30mA and a three-pole circuit breaker 16A; Characteristic C are installed. The Wallbox offers the option of being able to connect to the local network. An Ethernet cable with an RJ45 plug can be laid separately for this purpose to the wall box.',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),),
                        Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('Do I have to report my Wallbox to the responsible network operator or have it approved?',maxLines:10,style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ],
                          ),
                        ),
                        Text('Yes, a wall box with a charging capacity of up to 11kW must be reported to the network operator. However, this is only mandatory information, the network operator cannot raise any objections to the Wallbox. The situation is different for wall boxes with a possible charging capacity of more than 11kW. These must be approved by the responsible network operator. The network operator can refuse this approval and installation is then not permitted.',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),),
                        Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('Will water, humidity and weather affect charging with my Wallbox?',maxLines:10,style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ],
                          ),
                        ),
                        Text('The wallbox has protection class IP54. This means that the Wallbox is protected against dust and splashing water from all directions. Water and moisture therefore do not affect charging with the wall box. However, the installation of a weather protection roof is recommended if the Wallbox is installed outdoors.',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),), Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                              child: Text('Does the charging connector lock when charging?',
                                maxLines:10,style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ],
                          ),
                        ),
                        Text('For safety reasons, the charging connector is locked on the car while it is being charged. This not only offers protection against unauthorized pulling out of the charging cable, but also protects against possible arcing when the charging cable is pulled out while current is flowing into the car.',
                          style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),),
                        Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('How is loading started and stopped?',
                                  maxLines:10,style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Text('Charging is started and also ended via authorization using the supplied RFID chip. The Wallbox offers the possibility, if desired, to select the free charge mode. In this mode, authorization by means of an RFID chip is not necessary and the Wallbox starts charging as soon as a car is connected.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),),

                        Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('With what charging power does my car charge?',
                                  maxLines:10,style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Text('The wallbox charges the car with a maximum output of 11kW. For comparison: a maximum output of 3.6kW can be drawn from a normal household socket. However, since these household sockets are not designed for permanent maximum operation, charging with a wall box is recommended. There is then about three times as much power available and this is above all safer than charging via a household socket. For an electric car with an average battery size of 60kWh, this means that it can be fully charged in around 5.5 hours. However, the charging capacity of the Wallbox can be reduced if desired.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),),
                        Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('How much does charging with my Wallbox cost?',
                                  maxLines:10,style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Text('The cost of the electricity used to charge the electric car depends on a number of factors: Is there a photovoltaic system for your own electricity needs? Are there different electricity tariffs? What is the current cost of one kWh of electricity? A general answer to this question is therefore not readily possible. However, some cost estimates are listed below:For example, if the electricity for one kWh from the grid costs €0.35/kWh, the costs for a complete charge with a 60kWh battery add up to €0.35/kWh * 60kWh = €21. If there is a photovoltaic system that produces electricity for your own use, the costs can be reduced depending on the proportion of electricity from the photovoltaic system. However, you have to consider the acquisition costs of the photovoltaic system.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),),Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('How long does it take to charge my electric car?',
                                  maxLines:10,style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Text('For an electric car with an average battery of 60kWh and a maximum charging capacity of 11kW, the wallbox needs about 5.5 hours to fully charge the battery.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),),
                        Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('What is excess charging from photovoltaics?',
                                  maxLines:10,style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Text('If the building in which the Wallbox is installed has a photovoltaic system whose electricity can also be used for its own needs (not a photovoltaic system that has to feed 100% of the generated energy into the public grid), then this energy can be used to to charge an electric car connected to the wall box. Since the energy generated by the photovoltaic system can also be used for other consumers in the household, the surplus for charging the electric car results from the energy generated by the photovoltaic system minus all energies that are used in the household (e.g. washing machine, stove, light...) . The information on how much excess energy is currently available to charge the car, can be determined with an additional meter in the house installation and sent to the wall box via an interface (EEBUS or Modbus). The SMA converter offers its own information interface for this purpose, which can also be understood by the wall box.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),),Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('What is DC fault protection and why is it necessary?',
                                  maxLines:10,style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Text('An electric car that charges at a wall box is supplied with alternating current from the wall box\'s mains connection. The integrated charger in the electric car converts this alternating current into direct current to charge the batteries. Technical errors can occur on both the AC side (from the wall box to the electric car\'s onboard charger) and the DC side (downstream of the onboard charger to the battery). If these faults are not recognized directly, this can lead to dangerous voltages being applied to touchable parts of the Wallbox or the electric car, which can cause dangerous body currents if a person touches them. To prevent this, monitoring devices are installed that detect these errors directly, stop charging and electrically separate the wall box and the car from each other. This both on the AC side and on the DC side. The more expensive monitoring of DC fault currents is already integrated in the wall box with DC fault protection. The fault protection on the AC side must be implemented using a commercially available residual current circuit breaker (type A) in the building installation.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),),
                        Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('What is dynamic load management?',
                                  maxLines:10,style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Text('If several wall boxes are operated in parallel on one mains connection, the DLM offers the possibility of optimally distributing the available power to the wall boxes. This can be particularly useful in apartment buildings, in parking lots or other places where several wall boxes are operated in parallel. If, for example, a total power of 30kW is available for four wallboxes (since the electrical network does not provide more power at this point), without DLM each wallbox should use a maximum of 30kW/4 = 7.5kW, since this cannot be ruled out It is possible that all wallboxes are charging at the same time and then there is an overload. In this case, charging all wall boxes without DLM with their maximum output of 11kW would overload the grid connection with a total output of 44kW (4x11kW = 44kW). In this case, the wall boxes would have to be throttled to 7.5 kW. The DLM now makes it possible to effectively distribute the charging power to the four wall boxes in our example. If only one or two wallboxes are occupied, they can then charge with 11kW instead of the throttled 7.5kW charging power. If a further, third wall box is occupied, the charging power is shared between the three wall boxes (30kW/3 = 10kW), etc. so they can then charge with 11kW instead of throttled with 7.5kW charging power. If a further, third wall box is occupied, the charging power is shared between the three wall boxes (30kW/3 = 10kW), etc. so they can then charge with 11kW instead of throttled with 7.5kW charging power. If a further, third wall box is occupied, the charging power is shared between the three wall boxes (30kW/3 = 10kW), etc.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),),Container(
                          width: sw,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('Can I charge my car with the Wallbox on a time-controlled basis?',
                                  maxLines:10,style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Text('Yes, the Wallbox offers the option of selecting a loading time slot. It is not only possible to start or stop general charging in certain time windows, but also to select the maximum power in these time windows with which a connected electric car should be charged.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),),
                      ],
                    ),
                  ),
                ],
              ), ExpansionTile(title: Text('${english?'Information on\nApp usage:':'Informationen zur\nAppverwendung:'}',style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
                trailing: Container(child: Icon(Icons.keyboard_arrow_down,color: Colors.white,),decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
