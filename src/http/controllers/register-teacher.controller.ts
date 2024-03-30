// import { ERROR_LIST } from '@/constants/erros'
import { FastifyReply, FastifyRequest } from 'fastify'
import { z } from 'zod'
// import get from 'lodash/get'
import { makeRegisterTeacherUserCase } from '@/use-cases/register-teacher/make-register-user-case'

export async function registerTeacherController(
  request: FastifyRequest,
  reply: FastifyReply
) {
  const registerBodySchema = z.object({
    name: z.string(),
    email: z.string().email(),
    password: z.string().min(6),
  })

  const { name, email, password } = registerBodySchema.parse(request.body)

  try {
    const registerTeacher = makeRegisterTeacherUserCase()

    await registerTeacher.execute({ name, email, password })
  } catch (err) {
    // const errorMessage = get(err, 'message')
    // if (errorMessage === ERROR_LIST.REGISTER_USER.EMAIL_ALREADY_EXISTS) {
    //   return reply.status(409).send({ errorMessage })
    // } else {
    //   // TODO: Here we should log to an external tool like DataDog/NewRelic/Sentry
    // }
    // throw err
  }

  return reply.status(201).send()
}
